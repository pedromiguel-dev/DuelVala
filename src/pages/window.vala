/* window.vala
 *
 * Copyright 2023 pedromiguel-dev
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

public class Duelvala.Window : Adw.ApplicationWindow {
    public Duelvala.LeafLet stack;

    private enum Options {
      ROCK,
      PAPER,
      SCISSORS
    }

    private enum Results {
      VICTORY,
      DEFEAT,
      DRAW
    }

    construct {
        ActionEntry[] action_entries = {
            { "rock", this.on_rock_action },
            { "paper", this.on_paper_action },
            { "scissors", this.on_scissors_action },
            { "retry", this.on_retry }
        };
        add_action_entries (action_entries, this);
        title = "Duel";
	    set_default_size (400, 600);

        stack = new Duelvala.LeafLet ();
        var headerBar = new Duelvala.HeaderBar();
        var win_box = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);

        win_box.append (headerBar);
        win_box.append (stack);

        set_content (win_box);
    }

    public Window (Gtk.Application app) {
        Object (application: app);
    }
    private int get_result (int player_choice, int random_choice){
        if (player_choice == random_choice){return Results.DRAW;}

        if ((player_choice == Options.ROCK && random_choice == Options.SCISSORS) ||
          (player_choice == Options.PAPER && random_choice == Options.ROCK) ||
          (player_choice == Options.SCISSORS && random_choice == Options.PAPER)){
            return Results.VICTORY;
        } else {
            return Results.DEFEAT;
        }
    }
    private void on_action (Options opt) {
        int random_choice = GLib.Random.int_range (0, Options.SCISSORS + 1);
        int result = get_result(opt, random_choice);

        if (random_choice == Options.ROCK) stack.retry_page.page.set_icon_name ("rock");
        if (random_choice == Options.PAPER) stack.retry_page.page.set_icon_name ("paper");
        if (random_choice == Options.SCISSORS) stack.retry_page.page.set_icon_name ("scissors");

        if(result == Results.VICTORY) stack.retry_page.page.set_title ("You win");
        if(result == Results.DEFEAT) stack.retry_page.page.set_title ("You lose");
        if(result == Results.DRAW) stack.retry_page.page.set_title ("It's a Draw");

        stack.leaflet.navigate(Adw.NavigationDirection.FORWARD);
    }

    private void on_rock_action(){
        on_action(Options.ROCK);
    }
    private void on_paper_action(){
        on_action(Options.PAPER);
    }
    private void on_scissors_action(){
        on_action(Options.SCISSORS);
    }
    private void on_retry(){
        stack.leaflet.navigate(Adw.NavigationDirection.BACK);
    }
}


