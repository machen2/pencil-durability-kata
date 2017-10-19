# PencilDurability

This project was created as my solution to the Pencil Durability Kata listed [here](https://github.com/PillarTechnology/kata-pencil-durability). It's purpose is to simulate a pencil and it's ability to write, edit text, erase, and be sharpened. 

For more details on the specifications, please visit the link above.

## Installation

Fork and clone this repository.
Make sure you have Ruby and Bundler (`gem install bundler`) installed.

And then execute:

    $ bundle install

## Usage

To run the tests, execute:

    $ bundle exec rspec

If you would like to experiment with the functionality of the kata, run `bin/console`.

Get started by creating a new pencil and paper object by running the following, making sure to replace `length`, `eraser_durability`, and `point_durability` with integer values of your choosing:

    $ pencil = PencilDurability::Pencil.new(length, eraser_durability, point_durability)
    $ paper = PencilDurability::Paper.new

From there, you can call any of the following methods on `pencil`, where `input` is the string of text you want to write, edit, or erase and `paper` is the paper object created above:

    $ pencil.write_to_paper(input, paper) 
    $ pencil.erase_from_paper(input, paper)
    $ pencil.edit_paper(input, paper)

You can also sharpen the pencil if it becomes dull:

    $ pencil.sharpen

You can create a new pencil if your pencil becomes too short (thus unable to be sharpened) or runs out of erasing capabilities:
(Please make sure to replace `length`, `eraser_durability`, and `point_durability` with integer values of your choosing.)

    $ pencil = PencilDurability::Pencil.new(length, eraser_durability, point_durability)

You can check the status of your pencil or paper by typing the variable names you declared them with.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/machen2/pencil-durability-kata. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PencilDurability project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/machen2/pencil-durability-kata/blob/master/CODE_OF_CONDUCT.md).
