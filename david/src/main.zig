const std = @import("std");
const day1 = @import("day01.zig");

pub fn main() anyerror!void {
    var file = try std.fs.cwd().openFile("data/day01", .{});
    defer file.close();
    var buf: [1024 * 1024]u8 = undefined;
    var bytesRead = try file.readAll(buf[0..]);
    var res = day1.partOne(buf[0..], 2020);
    std.log.info("day 01: {}", .{ res });

    var res2 = day1.partTwo(buf[0..]);
    std.log.info("day 02: {}", .{ res2 });
}
