class AddShortNames(type):
    def __init__(cls, name, bases, attrs):
        super().__init__(name, bases, attrs)
        for name, attr in attrs.items():
            if callable(attr):
                short_name = (
                    attr.__name__[0].upper()
                )
                setattr(cls, short_name, attr)


class A(metaclass=AddShortNames):
    def foo(self):
        print(self.foo.__name__)

    def boo(self):
        print(self.boo.__name__)


a = A()

a.foo()
a.F()
a.B()
print(dir(a))
