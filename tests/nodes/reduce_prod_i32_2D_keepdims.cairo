mod input_0;
mod output_0;


use orion::operators::tensor::I32TensorPartialEq;
use orion::operators::tensor::I32Tensor;
use orion::utils::{assert_eq, assert_seq_eq};
use orion::operators::tensor::{TensorTrait, Tensor};
use core::array::{ArrayTrait, SpanTrait};

#[test]
#[available_gas(2000000000)]
fn test_reduce_prod_i32_2D_keepdims() {
    let input_0 = input_0::input_0();
    let z = output_0::output_0();

    let y = input_0.reduce_prod(0, true);

    assert_eq(y, z);
}
