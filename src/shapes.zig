const rl = @import("raylib");
const std = @import("std");

fn generateRandomPos(start: u32, limit: u32) anyerror!u32 {
    var prng = std.Random.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.posix.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });
    const rand = prng.random();

    return rand.intRangeAtMost(u32, start, limit);
}

var letters: [:0]const u8 = "ABCDEFGHIJKLMNOPQRSTUVXYZ";

pub const Circle = struct {
    screen_x: u32,
    screen_y: u32,
    center: rl.Vector2,
    radius: f32,
    ring_inner_r: f32,
    ring_outer_r: f32,
    color: rl.Color,
    letter: [1:0]u8,

    pub fn init(x: u32, y: u32) Circle {
        const genNumber = generateRandomPos(0, 24) catch 0;
        const letter = [1:0]u8{letters[genNumber]};

        return Circle{ .screen_x = x, .screen_y = y, .center = rl.Vector2.init(
            @floatFromInt(generateRandomPos(0 + 50, x + 50) catch 0),
            @floatFromInt(generateRandomPos(0 + 50, y + 50) catch 0),
        ), .radius = 50, .ring_inner_r = 150, .ring_outer_r = 155, .color = rl.Color.red, .letter = letter};
    }

    pub fn draw(self: *Circle) void {
        var buffer: [64]u8 = undefined;
        const result = std.fmt.bufPrintZ(&buffer, "X: {d}, Y: {d}, Letter: {s}", .{ self.center.x, self.center.y, self.letter }) catch {
            std.debug.print("Formatting failed\n", .{});
            return;
        };

        rl.drawCircleV(self.center, self.radius, rl.Color.white);
        rl.drawCircleV(self.center, self.radius - 10, rl.Color.init(153, 36, 44, 255));
        rl.drawRing(self.center, self.ring_inner_r, self.ring_outer_r, 0, 360, 0, rl.Color.init(244, 244, 244, 255));
        rl.drawText(&self.letter, @intFromFloat(self.center.x-8), @intFromFloat(self.center.y-12), 30, rl.Color.white);
        rl.drawText(result, 0, 0, 20, rl.Color.white);
    }

    pub fn update(self: *Circle) void {
        if (self.radius - 10 == self.ring_inner_r) {
            self.center = rl.Vector2.init(
                @floatFromInt(generateRandomPos(0 + 50, self.screen_x - 50) catch 0),
                @floatFromInt(generateRandomPos(0 + 50, self.screen_y - 50) catch 0),
            );
            self.ring_inner_r = 200;
            self.ring_outer_r = 205;
            const genNumber = generateRandomPos(0, 24) catch 0;
            self.letter = [1:0]u8{letters[genNumber]};
        } else {
            self.ring_inner_r -= 1;
            self.ring_outer_r -= 1;
        }
    }
};
