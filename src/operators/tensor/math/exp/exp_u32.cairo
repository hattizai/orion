use array::ArrayTrait;
use array::SpanTrait;
use option::OptionTrait;
use traits::Into;

use orion::numbers::fixed_point::core::{FixedTrait, FixedType};
use orion::operators::tensor::core::{Tensor, TensorTrait};
use orion::numbers::signed_integer::i32::i32;
use orion::operators::tensor::implementations::impl_tensor_fp8x23;
use orion::numbers::fixed_point::implementations::impl_8x23::fp8x23;
use orion::numbers::fixed_point::implementations::impl_8x23;
use orion::utils::check_gas;

/// Cf: TensorTrait::exp docstring
fn exp_u32_fp8x23(self: @Tensor<u32>) -> Tensor<FixedType> {
    let mut result = ArrayTrait::new();
    let mut data = *self.data;

    loop {
        check_gas();

        let ele = FixedTrait::from_unscaled_felt((*data.pop_front().unwrap()).into());

        result.append(FixedTrait::exp(ele));

        if (data.len() == 0) {
            break ();
        };
    };

    return TensorTrait::<FixedType>::new(*self.shape, result.span());
}
