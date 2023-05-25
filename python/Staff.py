class NonExistentEmployeeException(Exception):
    def __init__(self, message):
        self.message = message
        super().__init__(self.message)

    def __str__(self):
        return f"NonExistentEmployeeException: {self.message}"


class NegativeSalaryException(Exception):
    def __init__(self, name, salary):
        self.name = name
        self.salary = salary
        super().__init__(name, salary)

    def __str__(self):
        return f"O empregado {self.name} não pode ter o salário negativo"


class Staff:
    payroll = {}

    def getSalary(self, name):
        if name in self.payroll:
            return self.payroll[name]
        else:
            raise NonExistentEmployeeException("Empregado não encontrado!")

    def addEmp(self, name, salary):
        if salary >= 0:
            self.payroll[name] = salary
        else:
            raise NegativeSalaryException(name, salary)

    def raiseSalary(self, name, salary):
        if name not in self.payroll:
            raise NonExistentEmployeeException("Empregado não encontrado!")
        if self.payroll[name] + salary < 0:
            raise NegativeSalaryException(name, salary)

        self.payroll[name] = self.payroll[name] + salary


def readEmployees(s):
    name = input("Please, enter a name (Press RETURN to finish) ")
    while name != "":
        salary = float(input("Please, enter the salary: "))
        try:
            s.raiseSalary(name, salary)
        except NonExistentEmployeeException as ne:
            print(ne)
            print("Não foi possível concluir a operação. Por favor, tente novamente")
        except NegativeSalaryException as ns:
            print(ns)
            print("Não foi possível  a operação. Por favor, tente novamente")
        name = input("Please, enter a name (Press RETURN to finish) ")


s = Staff()
s.addEmp("carlos", 1000)
s.addEmp("joao", 1500)
s.addEmp("andre", 600)
readEmployees(s)
