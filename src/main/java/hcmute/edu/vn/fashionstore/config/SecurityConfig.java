package hcmute.edu.vn.fashionstore.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                // Tạm thời cho phép truy cập tất cả các đường dẫn mà không cần đăng nhập
                .authorizeHttpRequests(auth -> auth
                        .anyRequest().permitAll()
                )
                // Tạm tắt bảo vệ CSRF để dễ dàng test form post sau này
                .csrf(csrf -> csrf.disable());

        return http.build();
    }
}