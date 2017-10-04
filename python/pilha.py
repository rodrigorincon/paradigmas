class Pilha(object):
    def __init__(self):
        self.dados = []
        self.min_list = []
 
    def push(self, elemento):
    	if len(self.min_list) == 0:
    		menor = elemento
    	else:
	    	menor = elemento if elemento < self.min_list[-1] else self.min_list[-1]
    	self.min_list.append(menor)
        self.dados.append(elemento)
 
    def pop(self):
    	self.min_list.pop()
        return self.dados.pop()


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
