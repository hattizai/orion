use core::array::ArrayTrait;
use core::array::SpanTrait;
use core::option::OptionTrait;
use core::traits::Into;

use orion::numbers::NumberTrait;
use orion::numbers::fixed_point::core::FixedTrait;
use orion::operators::tensor::core::{Tensor, TensorTrait};


/// Cf: TensorTrait::asinh docstring
fn asinh<
    T,
    MAG,
    impl FFixedTrait: FixedTrait<T, MAG>,
    impl FTensor: TensorTrait<T>,
    impl FCopy: Copy<T>,
    impl FDrop: Drop<T>,
>(
    mut self: Tensor<T>
) -> Tensor<T> {
    let mut result = ArrayTrait::new();

    loop {
        match self.data.pop_front() {
            Option::Some(item) => { result.append((*item).asinh()); },
            Option::None(_) => { break; }
        };
    };

    return TensorTrait::new(self.shape, result.span());
}

