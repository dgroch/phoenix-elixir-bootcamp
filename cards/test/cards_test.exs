defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  @deck Cards.create_deck

  test "it creates a deck of cards" do
    assert length(@deck) == 52
    assert Cards.contains?(@deck, "Ace of Spades")
    refute Cards.contains?(@deck, "Hello, World!")
  end

  test "it shuffles a deck of cards" do
    shuffled_deck = Cards.shuffle(@deck)
    assert length(shuffled_deck) == 52
    refute shuffled_deck == @deck
  end

  test "it checks whether a list contains a card" do
    assert Cards.contains?(@deck, "Ace of Spades")
    refute Cards.contains?(@deck, "Hello, World!")
  end

  test "it deals a deck of cards" do
    hand = Cards.deal(@deck, 5)
    assert length(hand) == 5
  end

  test "it saves a deck to the filesystem" do
    result = Cards.save(@deck, "test_file")
    assert result == :ok
  end


  test "it loads a deck from the filesystem" do
    deck = Cards.load("test_file")
    assert length(deck) == 52
  end

  test "it creates a deck, shuffles it and deals a hand" do
    hand = Cards.create_hand(10)
    assert length(hand) == 10
  end
end
