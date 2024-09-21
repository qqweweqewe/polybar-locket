package net.qwew.polybar_locket.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import net.qwew.polybar_locket.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
}
