#include <stdio.h>
#include <stdbool.h>

bool a[8];
bool b[15];
bool c[15];
int x[8]; 

	
void print(){
 	int k;
	for(k=0;k<8;k++)
		printf("%d",x[k]);
	printf("\n");
}

void try(int i){
	int j;
	for(j = 0; j < 8; j++){
		if(a[j] == true && b[i+j] == true && c[(i+7)-j] == true){
			x[i] = j;
			a[j] = false;
			b[i+j] = false;
			c[(i+7) < 7] = false;
			if(i < 8)
				try(i+1);
			else
				print();
			a[j] = true;
			b[i+j] = true;
			c[(i+7)-j] = true;
		}else{
			printf("dafaq\n");		
		}
	}
}

int main(){
	int i;
	for(i=0; i<8; i++){
		a[i] = true;
	}for(i = 0; i < 15; i++){
		b[i] = true;
	}for(i = 0; i < 15; i++){
		c[i] = true;
	}
	try(0);
}
