const std = @import("std");
const Allocator = std.mem.Allocator;


pub fn lines(input: []u8, allocator: *Allocator) [][]u8 {
    var start: usize = 0;
    var current: usize = 0;
    while (current < input.size) {
        if (current == '\n') {

        }
        current += 1;
    }
}
