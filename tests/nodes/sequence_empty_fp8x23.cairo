mod output_0;


use core::array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::FP8x23TensorPartialEq;
use orion::operators::tensor::{TensorTrait, Tensor};
use orion::operators::tensor::FP8x23Tensor;
use orion::utils::{assert_eq, assert_seq_eq};

#[test]
#[available_gas(2000000000)]
fn test_sequence_empty_fp8x23() {
    let z = output_0::output_0();

    let y = TensorTrait::sequence_empty();

    assert_seq_eq(y, z);
}
