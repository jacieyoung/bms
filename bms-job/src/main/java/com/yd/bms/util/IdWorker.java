/**
 * @author wangpeng
 * @create 2018-07-02 10:56
 **/
package com.yd.bms.util;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.util.Random;

public class IdWorker {

    private static final long workerIdBits = 5L;
    private static final long dataCenterIdBits = 5L;
    private static final long maxWorkerId = 31L;
    private static final long maxDataCenterId = 31L;
    private static final long sequenceBits = 12L;
    private static final long workerIdShift = 12L;
    private static final long dataCenterIdShift = 17L;
    private static final long timestampLeftShift = 22L;
    private static final long sequenceMask = 4095L;
    private static final Random r = new Random();
    private final long workerId;
    private final long dataCenterId;
    private final long idEpoch;
    private long lastTimestamp;
    private long sequence;

    public IdWorker() {
        this(1419242747142L);
    }

    public IdWorker(long idEpoch) {
        this((long) r.nextInt(31), (long) r.nextInt(31), 0L, idEpoch);
    }

    public IdWorker(long dataCenterId, long workerId) {
        this(dataCenterId, workerId, 1419242747142L);
    }

    public IdWorker(long dataCenterId, long workerId, long idEpoch) {
        this(dataCenterId, workerId, 0L, idEpoch);
    }

    public IdWorker(long dataCenterId, long workerId, long sequence, long idEpoch) {
        this.lastTimestamp = -1L;
        this.dataCenterId = dataCenterId;
        this.workerId = workerId;
        this.sequence = sequence;
        this.idEpoch = idEpoch;
        if (workerId >= 0L && workerId <= 31L) {
            if (dataCenterId >= 0L && dataCenterId <= 31L) {
                if (idEpoch >= System.currentTimeMillis()) {
                    throw new IllegalArgumentException("idEpoch is illegal: " + idEpoch);
                }
            } else {
                throw new IllegalArgumentException("dataCenterId is illegal: " + workerId);
            }
        } else {
            throw new IllegalArgumentException("workerId is illegal: " + workerId);
        }
    }

    public static void main(String[] args) {
        IdWorker idWorker = new IdWorker();
        for (int i = 0; i < 10; ++i) {
            System.out.println(idWorker.getId());
        }

    }

    public long getId() {
        long id = this.nextId();
        return id;
    }

    public long[] getIds(int count) {
        if (count > 1000) {
            throw new IllegalArgumentException("get up to 1000 at most each time");
        } else {
            long[] ids = new long[count];

            for (int i = 0; i < count; ++i) {
                ids[i] = this.nextId();
            }

            return ids;
        }
    }

    private synchronized long nextId() {
        long timestamp = this.timeGen();
        if (timestamp < this.lastTimestamp) {
            throw new IllegalStateException("Clock moved backwards.");
        } else {
            if (this.lastTimestamp == timestamp) {
                this.sequence = this.sequence + 1L & 4095L;
                if (this.sequence == 0L) {
                    timestamp = this.tilNextMillis(this.lastTimestamp);
                }
            } else {
                this.sequence = 0L;
            }

            this.lastTimestamp = timestamp;
            long id = timestamp - this.idEpoch << 22 | this.dataCenterId << 17 | this.workerId << 12 | this.sequence;
            return id;
        }
    }

    private long tilNextMillis(long lastTimestamp) {
        long timestamp;
        for (timestamp = this.timeGen(); timestamp <= lastTimestamp; timestamp = this.timeGen()) {
            ;
        }

        return timestamp;
    }

    private long timeGen() {
        return System.currentTimeMillis();
    }

    public String toString() {
        return (new ToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE)).append("dataCenterId", this.dataCenterId).append("workerId", this.workerId).append("idEpoch", this.idEpoch).append("lastTimestamp", this.lastTimestamp).append("sequence", this.sequence).append("sequenceMask", 4095L).toString();
    }

}
