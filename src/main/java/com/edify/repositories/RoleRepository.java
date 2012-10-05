package com.edify.repositories;

import com.edify.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author <a href="https://github.com/jarias">jarias</a>
 */
public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByAuthority(String authority);
}
