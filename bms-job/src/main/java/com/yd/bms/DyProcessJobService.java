package com.yd.bms;

import java.io.Serializable;

public interface DyProcessJobService extends Serializable{
    void doJob() throws Exception;
    void changeIsRun(boolean isRun);
}
