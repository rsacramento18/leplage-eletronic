// raylib-zig (c) Nikolas Wipper 2023

const rl = @import("raylib");
const sp = @import("shapes.zig");

pub fn main() anyerror!void {
    // const WINDOW_WIDTH = 2880;
    // const WINDOW_HEIGHT = 1620;
    const SCREEN_WIDTH = 1920;
    const SCREEN_HEIGHT = 1080;

    var circle = sp.Circle.init(SCREEN_WIDTH, SCREEN_HEIGHT);

    rl.setConfigFlags(.{
        // .window_highdpi = true,
        .msaa_4x_hint = true,
        // .vsync_hint = true, 
    });
    rl.initWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Leplage Eletronic");
    // rl.setWindowSize(SCREEN_WIDTH, SCREEN_HEIGHT);
    defer rl.closeWindow();

    // var framesCounter: u32 = 0;

    rl.setTargetFPS(120);
    while(!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(rl.Color.black);



        //Update
        // framesCounter+=1;
        // if (((framesCounter/30)%2) == 1)
        // {
            circle.update();
            // framesCounter = 0;
        // }

        circle.draw();
    }
}
