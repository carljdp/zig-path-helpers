const std = @import("std");

fn shouldReturn(value: bool) bool {
    return value;
}

test "shouldReturn()" {
    const expected = true;
    const actual = shouldReturn(true);
    try std.testing.expect(actual == expected);
}

pub fn main() !u8 {
    // `pub fn main()` is required to build as executable

    if (@import("builtin").is_test) {
        std.debug.print("<- Ignore that `error:`", .{});
    } else {
        std.debug.print("It works!", .{});
    }

    return 0;
}

test "main()" {
    const expected = 0;
    const actual = try main();
    try std.testing.expect(actual == expected);
}
