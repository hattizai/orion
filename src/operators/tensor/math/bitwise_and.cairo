use core::array::ArrayTrait;
use core::option::OptionTrait;
use core::array::SpanTrait;
use core::debug::PrintTrait;

use orion::numbers::NumberTrait;
use orion::operators::tensor::core::{Tensor, TensorTrait, unravel_index};
use orion::operators::tensor::helpers::{
    broadcast_shape, broadcast_index_mapping, len_from_shape, check_compatibility
};

/// Cf: TensorTrait::and docstring
fn bitwise_and<
    T,
    MAG,
    impl TNumber: NumberTrait<T, MAG>,
    impl TTensor: TensorTrait<T>,
    impl TCopy: Copy<T>,
    impl TDrop: Drop<T>
>(
    y: @Tensor<T>, z: @Tensor<T>
) -> Tensor<T> {
    'check_compatibility'.print();
    let broadcasted_shape = broadcast_shape(*y.shape, *z.shape);
    let mut result: Array<T> = ArrayTrait::<T>::new();

    let num_elements = len_from_shape(broadcasted_shape);
    'checked'.print();

    let mut n: usize = 0;
    loop {
        let indices_broadcasted = unravel_index(n, broadcasted_shape);

        let indices_self = broadcast_index_mapping(*y.shape, indices_broadcasted);
        let indices_other = broadcast_index_mapping(*z.shape, indices_broadcasted);

        let lhs = *(*y.data)[indices_self];
        let rhs = *(*z.data)[indices_other];

        result.append(NumberTrait::bitwise_and(lhs, rhs));
        // let res = *(*y.data).at(n) ^ *(*z.data).at(n)
        // result.append(res);

        n += 1;
        if n == num_elements {
            break ();
        };
    };

    return TensorTrait::<T>::new(broadcasted_shape, result.span());
}
