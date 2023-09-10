const std = @import("std");

pub const Project = struct {
    pub const Name = "zig-path-helpers";
    pub const EntryPoint = "src/main.zig";
};

const PROJECT_NAME = "zig-path-helpers";

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // STEP: `zig build [install]` (default)
    const lib = b.addStaticLibrary(.{
        .name = Project.Name,
        .root_source_file = .{ .path = Project.EntryPoint },
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(lib);

    // STEP: `zig build test`
    const main_tests = b.addTest(.{
        .root_source_file = .{ .path = Project.EntryPoint },
        .target = target,
        .optimize = optimize,
    });
    const run_main_tests = b.addRunArtifact(main_tests);
    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&run_main_tests.step);
}
