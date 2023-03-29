const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const mode = b.standardReleaseOptions();

   // builds the library as a static library
    {
    const lib = b.addStaticLibrary("base58z", "src/base58z.zig");
    lib.setBuildMode(mode);
    lib.install();
    }

    // builds and runs the tests
    {
    const base58z_tests = b.addTest("src/base58z.zig");
    base58z_tests.setBuildMode(mode);
    base58z_tests.use_stage1 = true;
    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&base58z_tests.step);
    }
}
