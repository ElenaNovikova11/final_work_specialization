import sys
#Создаем классы
class Animal:
    def init_ (self, name, date_birth):
        self._name = name
        self._date_birth = date_birth
        self._teams = []

    def get_name(self):
        return self._name

    def get_date_birth(self):
        return self._date_birth

    def add_teams(self, teams):
        self._teams.append(teams)

    def get_teams(self):
        return self._teams

class Pets(Animal):
    pass

class Pack_animals(Animal):
    pass

class Dogs(Pets):
    pass

class Cats(Pets):
    pass

class Hamsters(Pets):
    pass

class Horses(Pack_animals):
    pass

class Donkeys(Pack_animals):
    pass

animals_ = []

#Заводим новое животное
def add_animal():
    name = input("Введите имя животного: ")
    date_birth = input("Введите дату рождения животного (гггг-мм-дд): ")
    type_an = input("Введите тип животного (dogs, cats, hamsters, horses, donkeys): ").capitalize()

    if type_an == 'dogs':
        an = Dogs(name, date_birth)
    elif type_an == 'cats':
        an = Cats(name, date_birth)
    elif type_an == 'hamsters':
        an = Hamsters(name, date_birth)
    elif type_an == 'horses':
        an = Horses(name, date_birth)
    elif type_an == 'donkeys':
        an = Donkeys(name, date_birth)
    else:
        print("Неверный тип")
        return

    animals_.append(an)

# Показать команды животного
def show_commands():
    name = input("Введите имя животного: ")
    for animal in animals_:
        if animal.get_name() == name:
            teams = animal.get_teams()
            if teams:
                print(f"Команда для {name}: {', '.join(teams)}")
            else:
                print(f"{name} не знает команд")
            return
    print("Животное не найдено")

# Обучить команде животного
def train_team():
    name = input("Введите имя животного: ")
    teams = input("Введите новую команду: ")
    for animal in animals_:
        if animal.get_name() == name:
            animal.add_teams(teams)
            print(f"{name} теперь знает команду: {teams}")
            return
    print("Животное не найдено")
#Меню
def menu():
    while True:
        print("\nГлавное меню:")
        print("1. Завести новое животное")
        print("2. Показать команды животного")
        print("3. Обучить животное новой команде")
        print("4. Выйти")
        i = input("Выберите действие: ")
       
        if i == '1':
            add_animal()
        elif i == '2':
            show_commands()
        elif i == '3':
            train_team()
        elif i == '4':
            break
        else:
            print("Неверный выбор, попробуйте снова")

#Класс Счетчик
class CounterError(Exception):
    pass

class Счетчик:
    def __init__(self):
        self.count = 0
        self.closed = False

    def add(self):
        if self.closed:
            raise CounterError("Ресурс уже закрыт")
        self.count += 1

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        if exc_type or exc_val or exc_tb:
            self.closed = True
            return False
        self.closed = True
        return True

if __name__ == "__main__":
    try:
        a = Счетчик()
        with a:
            menu()
    except CounterError as e:
        print(f"Произошла ошибка: {str(e)}")