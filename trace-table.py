# Trace Table Example

def trace_table(x,y):
    temp = 0; # O(1)
    while x > 0:
        #checks if x is odd, if is adds the value of y to temp
        if x % 2 ==1: # O(1)
            temp = temp + y # O(1)
        #this takes x is half and doubles y
        x = x // 2 # O(1)
        y = y * 2 # O(1)
    return temp # O(1)

#O(log(x)) trace table
print(trace_table(5,2))
print(trace_table(4,2))
print(trace_table(6,-2))
print(trace_table(0,0))
print(trace_table(16,2))

#Table 
def print_trace_table(x, y):
    print("| Iteration | x  | y  | result |") # O(1)
    print("|-----------|----|----|--------|") # O(1)
    result = 0 # O(1)
    iteration = 0 # O(1)
    while x > 0: #while loop O(log(n))
        if x % 2 == 1: # O(1)
            result = result + y # O(1)
        print(f"| {iteration:^10} | {x:^2} | {y:^2} | {result:^6} |") # O(1)
        x = x // 2 # O(1)
        y = y * 2 # O(1)
        iteration += 1 # O(1)

#O(log(x)) trace table

print_trace_table(5, 2)

print_trace_table(4, 2)

print_trace_table(6, -2)

print_trace_table(0, 0)

print_trace_table(16, 2)

