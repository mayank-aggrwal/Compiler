
#include <bits/stdc++.h>
using namespace std;

// template <typename t>
class node {
    int key, value;
    node *next;

    public:
    node(int key, int value) {
        this->key = key;
        this->value = value;
        next = NULL;
    }
    friend class HashMap;

};

class HashMap {
    node **buckets;
    int capacity, size;
    double loadFactor;

    public:
    HashMap() {
        buckets = new node*[5];
        for(int i=0; i<5; i++)
            buckets[i] = NULL;
        capacity = 5;
        size = 0;
        loadFactor = 0;
    }

    int hash(int key) {
        int sum = 0;
        while(key) {
            sum += (key%10);
            key /= 10;
        }
        return sum % capacity;
    }

    void rehash() {
        node **oldBuckets = buckets;
        buckets = new node*[2*capacity];
        for(int i=0; i<2*capacity; i++) 
            buckets[i] = NULL;
        int till = capacity;
        capacity <<= 1;
        size = 0;
        for(int i=0; i<till; i++) {
            node *tmp = oldBuckets[i];
            while(tmp != NULL) {
                node *np = tmp;
                insert(tmp->key, tmp->value);
                tmp = tmp->next;
                delete np;
            }
        }
        delete oldBuckets;
    }

    void insert(int key, int value) {
        node *np = new node(key, value);
        int index = hash(key);
        if(buckets[index] == NULL) {
            buckets[index] = np;
        }
        else {
            node *tmp = buckets[index];
            while(tmp->next != NULL) {
                tmp = tmp->next;
            }
            tmp->next = np;
        }
        size++;

        if(getLoadFactor() >= 0.75) {
            rehash();
        }
    }

    int hsize() {
        return size;
    }

    int hcapacity() {
        return capacity;
    }

    void erase(int key) {
        int index = hash(key);
        node *tmp = buckets[index], *prev = tmp;

        if(tmp != NULL && tmp->key == key) {
            buckets[index] = tmp->next;
        }

        while(tmp != NULL) {
            if(tmp->key == key) {
                prev->next = tmp->next;
                delete tmp;
                return ;
            }
            prev = tmp;
            tmp = tmp->next;
        }
    }

    int at(int key) {
        int index = hash(key);
        node *tmp = buckets[index];
        while(tmp != NULL) {
            if(tmp->key == key)
                return tmp->value;
            tmp = tmp->next;
        }
        return INT_MIN;
    }
    
    double getLoadFactor() {
        return (1.0*size/capacity);
    }


};

int main() {

    HashMap h;

    for(int i=0; i<20; i++) {
        h.insert(i, i+1);
        cout << "INSERTED: " << i << " LF: " << h.getLoadFactor() << " SIZE: " << h.hsize() << " CAPACITY: " << h.hcapacity() << endl;
    }

}