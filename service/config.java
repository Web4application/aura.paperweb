@Service
@Transactional
public class UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    public UserDto createUser(CreateUserRequest request) {
        User user = new User(request.getName(), request.getEmail());
        User saved = userRepository.save(user);
        return UserMapper.toDto(saved);
    }
    
    public List<UserDto> getAllUsers() {
        return userRepository.findAll()
            .stream()
            .map(UserMapper::toDto)
            .collect(Collectors.toList());
    }
}
