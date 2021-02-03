include <../includes.scad>

/* here's how to use the legends() command.
   The first argument is the legend itself, which can also be a whole string.
   The second argument is the "position" of the legend relative to center.
   Legends currently have to all be inset or outset at the same time, but you
   can have as many of them as you want.
   The numbers used are some magic constant, so just fudge them until it looks good.
*/

/* $outset_legends = true; */
legends = [
  ["A", "ש"],
  ["S", "ד"],
  ["D", "ג"],
];

$font_size = 6;

for (x=[0:len(legends)-1]) {
  translate_u(x,0) dcs_row(3-1) {
    legend(legends[x][0], [-0.8,-0.9]) {
      legend(legends[x][1], [0.8,0.9]) {
            $stem_support_type = "disable";
            $inset_legend_depth = 0.3;
            $dish_type = "disable";

          union() {
      // swap the debug()s to render opposite part
      //debug()
        key(true);
       //debug()  
        dished() {
        legends($inset_legend_depth);
      }
    }
          }
        }
      }
    }

