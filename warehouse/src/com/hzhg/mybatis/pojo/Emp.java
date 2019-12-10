package com.hzhg.mybatis.pojo;

public class Emp {
    private int uid;
    private String uname;
    private double sal;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public double getSal() {
        return sal;
    }

    public void setSal(double sal) {
        this.sal = sal;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", sal=" + sal +
                '}';
    }
}
