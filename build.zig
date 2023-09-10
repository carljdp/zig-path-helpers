const std = @import("std");

pub const Project = struct {
    pub const Name = "zig-path-helpers";
    pub const EntryPoint = "src/main.zig";
};

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // ------------------------------------------------------------------------
    // Compile Steps

    const compileLib = b.addStaticLibrary(.{
        .name = Project.Name,
        .root_source_file = .{ .path = Project.EntryPoint },
        .target = target,
        .optimize = optimize,
    });

    const compileExe = b.addExecutable(.{
        .name = Project.Name,
        .root_source_file = .{ .path = Project.EntryPoint },
        .target = target,
        .optimize = optimize,
    });

    const compileTests = b.addTest(.{
        .root_source_file = .{ .path = Project.EntryPoint },
        .target = target,
        .optimize = optimize,
    });

    // ------------------------------------------------------------------------
    // Install Steps

    const installLib = b.addInstallArtifact(compileLib, .{
        // default prefix for library is `zig-out/lib`
    });

    const installExe = b.addInstallArtifact(compileExe, .{
        // default prefix for executable is `zig-out/bin`
    });

    // ------------------------------------------------------------------------
    // Run Steps

    const runExe = b.addRunArtifact(compileExe);
    runExe.step.dependOn(&installExe.step);

    const runTests = b.addRunArtifact(compileTests);
    // no need to install for running tests

    // ------------------------------------------------------------------------
    // Top Level Steps - print via `zig build --list-steps`.

    // `install` (default)
    b.install_tls.description = "Build & Install (library & executable)";
    const zigBuildDefault = b.getInstallStep();
    zigBuildDefault.dependOn(&installLib.step);
    zigBuildDefault.dependOn(&installExe.step);

    // `test`
    const zigBuildTest = b.step("test", "Run Tests");
    zigBuildTest.dependOn(&runTests.step);

    // `run`
    const zigBuildRun = b.step("run", "Run Executable");
    zigBuildRun.dependOn(&runExe.step);

    // easter egg :)
    const zigBuildMeh = b.step("_", "");
    zigBuildMeh.dependOn(&runExe.step);
    _ = b.step(" \\_(ツ)_/¯ Meh", "");
}
