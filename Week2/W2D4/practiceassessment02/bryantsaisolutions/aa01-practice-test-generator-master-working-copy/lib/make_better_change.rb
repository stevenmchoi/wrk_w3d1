# make better change problem from class
# make_better_change(24, [10,7,1]) should return [10,7,7]
# make change with the fewest number of coins

# To make_better_change, we only take one coin at a time and
# never rule out denominations that we've already used.
# This allows each coin to be available each time we get a new remainder.
# By iterating over the denominations and continuing to search
# for the best change, we assure that we test for 'non-greedy' uses
# of each denomination.
require 'byebug'
def make_better_change(value, coins)
  #debugger
  possible_combinations = []
  return [] if value.zero?
  return nil if coins.empty?
  return nil if coins.all? { |coin| coin > value }
  coins = coins.sort { |l, r| r <=> l}
  biggest = coins[0]
  #Biggest coin is too big to be used
  return make_better_change(value, coins[1..-1]) if biggest > value

  #Best I can do using the biggest coin
  best_w_biggest_coin = make_better_change(value-biggest, coins)
  best_w_biggest_coin << biggest unless best_w_biggest_coin.nil?
  #Best I can do without using the biggest coin
  best_wo_biggest_coin = make_better_change(value, coins[1..-1])

  solution = nil
  if best_w_biggest_coin && best_wo_biggest_coin
    opt_wo_biggest = best_wo_biggest_coin.length
    opt_w_biggest = best_w_biggest_coin.length
    
    if opt_wo_biggest < opt_w_biggest
      solution = best_wo_biggest_coin
    else
      solution = best_w_biggest_coin
    end
  elsif best_wo_biggest_coin
    solution = best_wo_biggest_coin
  else
    solution = best_w_biggest_coin
  end
  solution  
end
