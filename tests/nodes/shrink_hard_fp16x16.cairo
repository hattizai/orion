mod input_0;
mod output_0;


use orion::operators::tensor::FP16x16Tensor;
use orion::operators::tensor::FP16x16TensorPartialEq;
use orion::operators::tensor::{TensorTrait, Tensor};
use orion::utils::{assert_eq, assert_seq_eq};
use core::array::{ArrayTrait, SpanTrait};
use orion::numbers::FixedTrait;

#[test]
#[available_gas(2000000000)]
fn test_shrink_hard_fp16x16() {
    let input_0 = input_0::input_0();
    let z = output_0::output_0();

    let y = TensorTrait::shrink(
        input_0, Option::None(()), Option::Some(FixedTrait::new(65536, false))
    );

    assert_eq(y, z);
}
