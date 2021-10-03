#include<stdio.h>
#include "util.h"
#include<string.h>

typedef struct tree *T_tree;
struct tree{
	T_tree left;
	string key;
	T_tree right;
};

T_tree Tree(T_tree left, string key, T_tree right){
	T_tree t = checked_malloc(sizeof(*t));
	t->left = left;
	t->key = key;
	t->right = right;
	return t;
}

T_tree insert(string key,T_tree t){
	if( t == NULL){
		return Tree(NULL,key,NULL);
	}
	if( strcmp(key,t->key) < 0){
		return Tree(insert(key,t->left),t->key,t->right);
	}else if( strcmp(key,t->key) > 0){
		return Tree(t->left,t->key,insert(key,t->right));
	}else{
		return Tree(t->left,key,t->right);
	}
	
}

int main(void){
	T_tree head = Tree(NULL,"bb",NULL);
	head = insert("aa",head);
	head = insert("cc",head);
	printf("%s\r\n",head->key);
	printf("%s\r\n",head->left->key);
	printf("%s\r\n",head->right->key);
}
