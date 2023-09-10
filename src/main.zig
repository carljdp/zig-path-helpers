const std = @import("std");
const testing = std.testing;

export fn itToBe(value: bool) bool {
    return value;
}

test "Expect itToBe(true)" {
    try testing.expect(itToBe(true));
}
