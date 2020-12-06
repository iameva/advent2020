const std = @import("std");

pub fn sliceToInt(str: []u8) !i32 {
    var result: i32 = 0;
    var i: usize = 0;
    while (i < str.len) {
        result = result * 10;
        switch (str[i]) {
            '0' ... '9' => {
                result += @intCast(i32, str[i] - '0');
            },
            else => {
                return error.ItBroke;
            }
        }
        i += 1;
    }
    return result;
}

pub fn partOne(input: [] u8, target: i32) !i32 {
    var start: usize = 0;
    var current: usize = 0;
    var allocator = std.testing.allocator;
    var map = std.AutoHashMap(i32, i32).init(allocator);
    while (current < input.len) {
        switch (input[current]) {
            0 => {
                current = input.len;
            },
            '\n' => {
                var num = try sliceToInt(input[start..current]);
                if (map.contains(target - num)) {
                    return (target - num) * num;
                } else {
                    try map.put(num, num);
                }
                start = current + 1;
            },
            else => {
            }
        }
        current += 1;
    }

    return error.ItBroke;
}

pub fn partTwo(input: []u8) !i32 {
    var start: usize = 0;
    var current: usize = 0;
    while (current < input.len) {
        switch (input[current]) {
            0 => {
                current = input.len;
            },
            '\n' => {
                var num = try sliceToInt(input[start..current]);
                var result = partOne(input, 2020 - num);
                if (result) |r| {
                    return num * r;
                } else |_| {
                    start = current + 1;
                }
            },
            else => {
            }
        }
        current += 1;
    }

    return error.ItBroke;
}

