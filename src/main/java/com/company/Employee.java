package com.company;

public class Employee {
    private int id;
    private String name;
    private String email;
    private String phone;
    private String role;
    private double salary;
    private int departmentId; // Added departmentId field
    private String departmentName; // Add this line

    public Employee(int id, String name, String email, String phone, String role, double salary, int departmentId, String departmentName) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.role = role;
        this.salary = salary;
        this.departmentId = departmentId;
        this.departmentName = departmentName; // Initialize this attribute
    }

    // Getters and Setters (if needed)

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getRole() {
        return role;
    }
    public double getSalary() {
        return salary;
    }
    public int getDepartmentId() {
        return departmentId; // Getter for departmentId
    }
    public String getDepartmentName() {
        return departmentName; // Getter for departmentId
    }
}

