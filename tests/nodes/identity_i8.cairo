mod input_0;
mod output_0;


use core::array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::TensorTrait;
use orion::operators::tensor::I8Tensor;
use orion::operators::tensor::I8TensorPartialEq;
use orion::utils::assert_eq;

#[test]
#[available_gas(2000000000)]
fn test_identity_i8() {
    let input_0 = input_0::input_0();
    let z = output_0::output_0();

    let y = input_0.identity();

    assert_eq(y, z);
}
