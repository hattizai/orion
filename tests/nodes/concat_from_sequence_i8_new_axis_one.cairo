mod input_0;
mod output_0;


use orion::operators::tensor::{TensorTrait, Tensor};
use orion::operators::tensor::I8TensorPartialEq;
use core::array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::I8Tensor;
use orion::utils::{assert_eq, assert_seq_eq};
use orion::numbers::signed_integer::{integer_trait::IntegerTrait, i32::i32};

#[test]
#[available_gas(2000000000)]
fn test_concat_from_sequence_i8_new_axis_one() {
    let input_0 = input_0::input_0();
    let z = output_0::output_0();

    let y = TensorTrait::concat_from_sequence(
        input_0, IntegerTrait::<i32>::new(1, false), Option::Some(1)
    );

    assert_eq(y, z);
}
