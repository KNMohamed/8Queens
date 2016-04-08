#include <stdio.h>
#include <stdbool.h>

bool a[9];
bool b[16];
bool c[17];
int x[9]; 

	
void print(){
 	int k;
	for(k=1;k<9;k++)
		printf("%d",x[k]);
	printf("\n");
}

void try(int i){
	int j;
	for(j = 1; j < 9; j++){
		if(a[j] == true && b[i+j-1] == true && c[i-j+9] == true){
			x[i] = j;
			a[j] = false;
			b[i+j-1] = false;
			c[i-j+9] = false;
			if(i < 9)
				try(i+1);
			else
				print();
			a[j] = true;
			b[i+j-1] = true;
			c[i-j+9] = true;
		}else{
			printf("dafaq\n");		
		}
	}
}

int main(){
	int i;
	for(i = 1; i < 9; i++){
		a[i] = true;
	}for(i = 1; i < 16; i++){
		b[i] = true;
	}for(i = 1; i < 17; i++){
		c[i] = true;
	}
	try(1);
}
