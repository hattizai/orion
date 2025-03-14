mod input_0;
mod input_1;
mod output_0;


use orion::operators::tensor::{TensorTrait, Tensor};
use orion::operators::tensor::I32Tensor;
use orion::operators::tensor::I32TensorPartialEq;
use orion::utils::{assert_eq, assert_seq_eq};
use orion::operators::tensor::I8Tensor;
use core::array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::I8TensorPartialEq;

#[test]
#[available_gas(2000000000)]
fn test_sequence_at_i8_positive() {
    let input_0 = input_0::input_0();
    let input_1 = input_1::input_1();
    let z = output_0::output_0();

    let y = TensorTrait::sequence_at(input_0, input_1);

    assert_eq(y, z);
}
