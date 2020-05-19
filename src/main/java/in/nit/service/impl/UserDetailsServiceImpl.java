package in.nit.service.impl;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.nit.dao.IUserDao;


//on click login button it is executed...
@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	@Autowired
	private IUserDao dao;
	
	@Override
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		//Read Model object based on emailId(Username)
		in.nit.model.User model=dao.getUserByEmail(username);
		
		//constrcut GA object using role object
		Set<GrantedAuthority> authorities=new HashSet<>();
		Set<String> roles=model.getRoles();
		
		for(String role:roles) {
			authorities.add(new SimpleGrantedAuthority(role));
		}
		//return Spring f/w user object
		return new org.springframework.security.core.userdetails.User(
				username, 
				model.getUserPwd(), 
				authorities);
	}

}
