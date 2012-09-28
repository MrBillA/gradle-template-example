package com.edify.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import org.apache.commons.lang.StringUtils;

/**
 * @author: <a href="https://github.com/jarias">jarias</a>
 */
@Entity
@Table(name = "users", uniqueConstraints = {@UniqueConstraint(columnNames = {"username"})})
public class User {
    public static final String[] TABLE_COLUMNS = {"id", "firstName", "lastName", "username"};
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    @NotNull
    @Email
    private String username;
    @NotNull
    @NotBlank
    private String password;
    @NotNull
    @NotBlank
    private String firstName;
    @NotNull
    @NotBlank
    private String lastName;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @PreUpdate
    @PrePersist
    private void encodePassword() {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        if (StringUtils.isNotBlank(password) && !password.startsWith("$2a$10$")) {
            String hashedPassword = passwordEncoder.encode(password);
            password = hashedPassword;
        }
    }
}
