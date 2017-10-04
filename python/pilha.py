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

