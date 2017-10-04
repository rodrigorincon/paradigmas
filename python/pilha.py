class Pilha(object):
    def __init__(self):
        self.dados = []
        self.min_list = []
 
    def push(self, elemento):
        if len(self.min_list) == 0:
    		self.min_list.append(elemento)
    	elif elemento <= self.min_list[-1]:
	    	self.min_list.append(elemento)

        self.dados.append(elemento)
 
    def pop(self):
    	if self.dados[-1] == self.min_list[-1]:
            self.min_list.pop()
        return self.dados.pop()

    def min(self):
        return self.min_list


p = Pilha()
p.push(30)
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
p.push(10)
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
p.push(40)
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
p.push(20)
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list

print p.pop()
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
print p.pop()
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
print p.pop()
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
print p.pop()
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list

p.push(30)
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
p.push(50)
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
p.push(10)
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
p.push(5)
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
p.push(10)
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
p.push(5)
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
p.push(5)
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
p.push(20)
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list

print p.pop()
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
print p.pop()
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
print p.pop()
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
print p.pop()
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
print p.pop()
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
print p.pop()
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
print p.pop()
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list
print p.pop()
print "DADOS"
print p.dados
print "MINIMO"
print p.min_list