mod input_0;
mod output_0;


use orion::operators::tensor::FP16x16Tensor;
use core::array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::{TensorTrait, Tensor};
use orion::utils::{assert_eq, assert_seq_eq};
use orion::operators::tensor::FP16x16TensorPartialEq;

#[test]
#[available_gas(2000000000)]
fn test_reduce_mean_fp16x16_2D_keepdims() {
    let input_0 = input_0::input_0();
    let z = output_0::output_0();

    let y = input_0.reduce_mean(Option::None(()), Option::Some(false), Option::None(()));

    assert_eq(y, z);
}
