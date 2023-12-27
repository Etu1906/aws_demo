package repository;

import org.springframework.stereotype.Repository;

import model.Employee;

@Repository
public interface EmployeeRepository extends CrudRepository<Employee, Integer> {
}
