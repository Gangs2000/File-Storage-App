package com.amazon.S3Storage.SecurityConfig;

import com.amazon.S3Storage.Document.Account;
import com.amazon.S3Storage.Repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class MyUserDetailsService implements UserDetailsService {

    @Autowired AccountRepository accountRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<Account> account=accountRepository.findById(username);
        if(account.isEmpty())
            throw new UsernameNotFoundException("Account is not exist in database..");
        return new AccountPrincipal(account);
    }
}
