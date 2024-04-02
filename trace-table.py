# Trace Table Example

def trace_table(x,y):
    temp = 0;
    while x > 0:
        #checks if x is odd, if is adds the value of y to temp
        if x % 2 ==1:
            temp = temp + y
        #this takes x is half and doubles y
        x = x // 2
        y = y * 2
    return temp


print(trace_table(5,2))
print(trace_table(4,2))
print(trace_table(6,-2))
print(trace_table(0,0))
print(trace_table(16,2))

#Table 
def print_trace_table(x, y):
    print("| Iteration | x  | y  | result |")
    print("|-----------|----|----|--------|")
    result = 0
    iteration = 0
    while x > 0:
        if x % 2 == 1:
            result = result + y
        print(f"| {iteration:^10} | {x:^2} | {y:^2} | {result:^6} |")
        x = x // 2
        y = y * 2
        iteration += 1

print_trace_table(5, 2)

print_trace_table(4, 2)

print_trace_table(6, -2)

print_trace_table(0, 0)

print_trace_table(16, 2)

