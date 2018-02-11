# in attack.erb
=begin
<% if @game.current_turn.computer? %>
<h1><%= @game.player2.name %> attacks <%= @game.player1.name %></h1>
<% else %>
  <% if @game.current_turn == @game.player1 %>
<h1><%= @game.player1.name %> attacks <%= @game.player2.name %></h1>
<% else %>
    <h1><%= @game.player2.name %> attacks <%= @game.player1.name %></h1>
<% end %>
    <form action="/switch-turn" method="post">
<input type="submit" value="Ok">
</form>
<% end %>
=end

# in play.erb
=begin
 <!--<% if @game.current_turn.computer? %>-->
      <!--<%= @game.attack %>-->
    <!--<% else %>-->
     <!--<form action="/attack" method="post">-->
         <!--<input type="submit" value="Attack">-->
     <!--</form>-->
    <!--<% end %>-->
=end

seed = ARGV[0].to_i
Kernel.srand(seed)
p (0..100).to_a.shuffle
