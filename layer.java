@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    
    List<User> findByEmailContaining(String email);
    
    @Query("SELECT u FROM User u WHERE u.active = true")
    List<User> findActiveUsers();
    
    Optional<User> findByEmail(String email);
    
    boolean existsByEmail(String email);
}
