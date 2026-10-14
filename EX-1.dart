enum Skill { FLUTTER, DART, OTHER }

class Address {
  String street;
  String city;
  String zipCode;

  Address(this.street, this.city, this.zipCode);
}

const skillSalary = {
  Skill.FLUTTER : 3000,
  Skill.DART : 2000,
  Skill.OTHER : 1000
};

class Employee {
  final String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearOfExperience;



  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearOfExperience);

  Employee.mobileDeveloper(String name, double baseSalary, Address address, int yearOfExperience) : this(name, baseSalary, [Skill.DART, Skill.FLUTTER], address, yearOfExperience);



  String get name => this._name;

  double get baseSalary => this._baseSalary;

  List<Skill> get skills => this._skills;

  Address get address => this._address;

  int get yearOfExperience => this._yearOfExperience;


  double computeSalary(){
    double salary = this._baseSalary;


    for(Skill skill in this._skills){
      salary += skillSalary[skill] as num;
    }


    salary += this._yearOfExperience * 1000;

    return salary;
  }



  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}');
  }
}

void main() {
  Address addr1 = Address("6A", "Phnom Penh", "12000");

  Address addr2 = Address("6B", "Siem Reap", "12000");
  var emp1 = Employee('Sokea', 40000, [Skill.DART], addr1, 4);
  emp1.printDetails();
  print(emp1.computeSalary());

  var emp2 = Employee.mobileDeveloper('Ronan', 45000, addr2, 10);
  emp2.printDetails();
  print(emp2.computeSalary());
}