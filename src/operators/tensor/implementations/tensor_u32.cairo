use core::array::ArrayTrait;
use core::array::SpanTrait;
use core::option::OptionTrait;
use core::traits::{TryInto, Into};

use orion::numbers::fixed_point::core::FixedTrait;
use orion::operators::tensor::helpers::SpanPartialOrd;
use orion::operators::tensor::core::{
    new_tensor, constant_of_shape, stride, Tensor, TensorTrait, ravel_index, unravel_index, reshape,
    at_tensor,
};
use orion::operators::tensor::{math, linalg, quantization, core as core_tensor, ml, manipulation};
use orion::numbers::{i8, i32, NumberTrait};
use orion::operators::tensor::implementations::{tensor_i8::I8Tensor, tensor_bool::BoolTensor};

impl U32Tensor of TensorTrait<u32> {
    fn new(shape: Span<usize>, data: Span<u32>) -> Tensor<u32> {
        new_tensor(shape, data)
    }

    fn constant_of_shape(shape: Span<usize>, value: u32) -> Tensor<u32> {
        constant_of_shape(shape, value)
    }

    fn at(self: @Tensor<u32>, indices: Span<usize>) -> u32 {
        *at_tensor(self, indices)
    }

    fn add(lhs: Tensor<u32>, rhs: Tensor<u32>) -> Tensor<u32> {
        math::arithmetic::add(@lhs, @rhs)
    }

    fn sub(lhs: Tensor<u32>, rhs: Tensor<u32>) -> Tensor<u32> {
        math::arithmetic::sub(@lhs, @rhs)
    }

    fn mul(lhs: Tensor<u32>, rhs: Tensor<u32>) -> Tensor<u32> {
        math::arithmetic::mul(@lhs, @rhs)
    }

    fn div(lhs: Tensor<u32>, rhs: Tensor<u32>) -> Tensor<u32> {
        math::arithmetic::div(@lhs, @rhs)
    }

    fn min_in_tensor(self: @Tensor<u32>) -> u32 {
        math::min_in_tensor::min_in_tensor::<u32, u32>(*self.data)
    }

    fn min(tensors: Span<Tensor<u32>>) -> Tensor<u32> {
        math::min::min(tensors)
    }

    fn max_in_tensor(self: @Tensor<u32>) -> u32 {
        math::max_in_tensor::max_in_tensor(*self.data)
    }

    fn max(tensors: Span<Tensor<u32>>) -> Tensor<u32> {
        math::max::max(tensors)
    }

    fn stride(self: @Tensor<u32>) -> Span<usize> {
        stride(*self.shape)
    }

    fn ravel_index(self: @Tensor<u32>, indices: Span<usize>) -> usize {
        ravel_index(*self.shape, indices)
    }

    fn unravel_index(self: @Tensor<u32>, index: usize) -> Span<usize> {
        unravel_index(index, *self.shape)
    }

    fn reshape(self: @Tensor<u32>, target_shape: Span<usize>) -> Tensor<u32> {
        reshape(self, target_shape)
    }

    fn reduce_sum(self: @Tensor<u32>, axis: usize, keepdims: bool) -> Tensor<u32> {
        math::reduce_sum::reduce_sum(self, axis, keepdims)
    }

    fn reduce_prod(self: @Tensor<u32>, axis: usize, keepdims: bool) -> Tensor<u32> {
        math::reduce_prod::reduce_prod(self, axis, keepdims)
    }

    fn argmax(
        self: @Tensor<u32>, axis: usize, keepdims: Option<bool>, select_last_index: Option<bool>
    ) -> Tensor<usize> {
        math::argmax::argmax(self, axis, keepdims, select_last_index)
    }

    fn argmin(
        self: @Tensor<u32>, axis: usize, keepdims: Option<bool>, select_last_index: Option<bool>
    ) -> Tensor<usize> {
        math::argmin::argmin(self, axis, keepdims, select_last_index)
    }

    fn transpose(self: @Tensor<u32>, axes: Span<usize>) -> Tensor<u32> {
        linalg::transpose::transpose(self, axes)
    }

    fn matmul(self: @Tensor<u32>, other: @Tensor<u32>) -> Tensor<u32> {
        linalg::matmul::matmul(self, other)
    }

    fn exp(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn log(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn equal(self: @Tensor<u32>, other: @Tensor<u32>) -> Tensor<usize> {
        math::equal::equal(self, other)
    }

    fn greater(self: @Tensor<u32>, other: @Tensor<u32>) -> Tensor<usize> {
        math::greater::greater(self, other)
    }

    fn greater_equal(self: @Tensor<u32>, other: @Tensor<u32>) -> Tensor<usize> {
        math::greater_equal::greater_equal(self, other)
    }

    fn less(self: @Tensor<u32>, other: @Tensor<u32>) -> Tensor<usize> {
        math::less::less(self, other)
    }

    fn less_equal(self: @Tensor<u32>, other: @Tensor<u32>) -> Tensor<usize> {
        math::less_equal::less_equal(self, other)
    }

    fn abs(self: @Tensor<u32>) -> Tensor<u32> {
        math::abs::abs(*self)
    }

    fn neg(self: @Tensor<u32>) -> Tensor<u32> {
        math::neg::neg(*self)
    }

    fn ceil(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn sin(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn cos(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn asin(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn cumsum(
        self: @Tensor<u32>, axis: usize, exclusive: Option<bool>, reverse: Option<bool>
    ) -> Tensor<u32> {
        math::cumsum::cumsum(self, axis, exclusive, reverse)
    }

    fn flatten(self: @Tensor<u32>, axis: usize) -> Tensor<u32> {
        math::flatten::flatten(self, axis)
    }

    fn sinh(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn tanh(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn cosh(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn acosh(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn asinh(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn atan(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn xor(self: @Tensor<u32>, other: @Tensor<u32>) -> Tensor<usize> {
        math::xor::xor(self, other)
    }

    fn or(self: @Tensor<u32>, other: @Tensor<u32>) -> Tensor<usize> {
        math::or::or(self, other)
    }

    fn acos(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn onehot(
        self: @Tensor<u32>, depth: usize, axis: Option<usize>, values: Span<usize>
    ) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn sqrt(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn concat(tensors: Span<Tensor<u32>>, axis: usize,) -> Tensor<u32> {
        math::concat::concat(tensors, axis)
    }

    fn quantize_linear(
        self: @Tensor<u32>, y_scale: @Tensor<u32>, y_zero_point: @Tensor<u32>
    ) -> Tensor::<i8> {
        panic(array!['not supported!'])
    }

    fn dequantize_linear(
        self: @Tensor<i8>, x_scale: @Tensor<u32>, x_zero_point: @Tensor<u32>
    ) -> Tensor::<u32> {
        panic(array!['not supported!'])
    }

    fn qlinear_add(
        self: @Tensor<i8>,
        a_scale: @Tensor<u32>,
        a_zero_point: @Tensor<u32>,
        b: @Tensor<i8>,
        b_scale: @Tensor<u32>,
        b_zero_point: @Tensor<u32>,
        y_scale: @Tensor<u32>,
        y_zero_point: @Tensor<u32>
    ) -> Tensor::<i8> {
        panic(array!['not supported!'])
    }

    fn qlinear_mul(
        self: @Tensor<i8>,
        a_scale: @Tensor<u32>,
        a_zero_point: @Tensor<u32>,
        b: @Tensor<i8>,
        b_scale: @Tensor<u32>,
        b_zero_point: @Tensor<u32>,
        y_scale: @Tensor<u32>,
        y_zero_point: @Tensor<u32>
    ) -> Tensor::<i8> {
        panic(array!['not supported!'])
    }

    fn qlinear_matmul(
        self: @Tensor<i8>,
        a_scale: @Tensor<u32>,
        a_zero_point: @Tensor<u32>,
        b: @Tensor<i8>,
        b_scale: @Tensor<u32>,
        b_zero_point: @Tensor<u32>,
        y_scale: @Tensor<u32>,
        y_zero_point: @Tensor<u32>
    ) -> Tensor::<i8> {
        panic(array!['not supported!'])
    }

    fn qlinear_concat(
        tensors: Span<Tensor<i8>>,
        scales: Span<Tensor<u32>>,
        zero_points: Span<Tensor<u32>>,
        y_scale: @Tensor<u32>,
        y_zero_point: @Tensor<u32>,
        axis: usize,
    ) -> Tensor::<i8> {
        panic(array!['not supported!'])
    }

    fn qlinear_leakyrelu(
        self: @Tensor<i8>, a_scale: @Tensor<u32>, a_zero_point: @Tensor<u32>, alpha: u32
    ) -> Tensor::<i8> {
        panic(array!['not supported!'])
    }

    fn slice(
        self: @Tensor<u32>,
        starts: Span<usize>,
        ends: Span<usize>,
        axes: Option<Span<usize>>,
        steps: Option<Span<usize>>
    ) -> Tensor<u32> {
        core_tensor::slice::<u32>(self, starts, ends, axes, steps)
    }

    fn gather(self: @Tensor<u32>, indices: Tensor<usize>, axis: Option<usize>) -> Tensor<u32> {
        math::gather::gather(self, indices, axis)
    }

    fn nonzero(self: @Tensor<u32>) -> Tensor<usize> {
        core_tensor::nonzero(self)
    }

    fn squeeze(self: @Tensor<u32>, axes: Option<Span<i32>>) -> Tensor<u32> {
        core_tensor::squeeze(self, axes)
    }

    fn unsqueeze(self: @Tensor<u32>, axes: Span<usize>) -> Tensor<u32> {
        core_tensor::unsqueeze(self, axes)
    }

    fn sign(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn clip(self: @Tensor<u32>, min: Option<u32>, max: Option<u32>) -> Tensor<u32> {
        core_tensor::clip(self, min, max)
    }

    fn and(self: @Tensor<bool>, other: @Tensor<bool>) -> Tensor<bool> {
        math::and::and(self, other)
    }

    fn identity(self: @Tensor<u32>) -> Tensor<u32> {
        core_tensor::identity(self)
    }

    fn where(self: @Tensor<u32>, x: @Tensor<u32>, y: @Tensor<u32>) -> Tensor<u32> {
        math::where::where(self, x, y)
    }

    fn bitwise_and(self: @Tensor<u32>, other: @Tensor<u32>) -> Tensor<u32> {
        math::bitwise_and::bitwise_and(self, other)
    }

    fn bitwise_xor(self: @Tensor<u32>, other: @Tensor<u32>) -> Tensor<u32> {
        math::bitwise_xor::bitwise_xor(self, other)
    }

    fn bitwise_or(self: @Tensor<u32>, other: @Tensor<u32>) -> Tensor<u32> {
        math::bitwise_or::bitwise_or(self, other)
    }

    fn round(self: @Tensor<u32>) -> Tensor<u32> {
        math::round::round(*self)
    }

    fn reduce_l1(self: @Tensor<u32>, axis: usize, keepdims: bool) -> Tensor<u32> {
        math::reduce_l1::reduce_l1(self, axis, keepdims)
    }

    fn trilu(self: @Tensor<u32>, upper: bool, k: i64) -> Tensor<u32> {
        linalg::trilu::trilu(self, upper, k)
    }

    fn scatter(
        self: @Tensor<u32>,
        updates: Tensor<u32>,
        indices: Tensor<usize>,
        axis: Option<usize>,
        reduction: Option<usize>
    ) -> Tensor<u32> {
        math::scatter::scatter(self, updates, indices, axis, reduction)
    }

    fn array_feature_extractor(self: @Tensor<u32>, indices: Tensor<usize>) -> Tensor<u32> {
        ml::array_feature_extractor::array_feature_extractor(*self, indices)
    }

    fn binarizer(self: @Tensor<u32>, threshold: Option<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn reduce_sum_square(self: @Tensor<u32>, axis: usize, keepdims: bool) -> Tensor<u32> {
        math::reduce_sum_square::reduce_sum_square(self, axis, keepdims)
    }

    fn reduce_l2(self: @Tensor<u32>, axis: usize, keepdims: bool) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn not(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn gather_elements(
        self: @Tensor<u32>, indices: Tensor<usize>, axis: Option<usize>
    ) -> Tensor<u32> {
        math::gather_elements::gather_elements(self, indices, axis)
    }

    fn sequence_length(self: Array<Tensor<u32>>) -> Tensor<u32> {
        math::sequence_length::sequence_length(self)
    }

    fn shrink(self: Tensor<u32>, bias: Option<u32>, lambd: Option<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn sequence_at(sequence: Array<Tensor<u32>>, position: Tensor<i32>) -> Tensor<u32> {
        math::sequence_at::sequence_at(sequence, position)
    }

    fn sequence_construct(tensors: Array<Tensor<u32>>) -> Array<Tensor<u32>> {
        math::sequence_construct::sequence_construct(tensors)
    }

    fn sequence_empty() -> Array<Tensor<u32>> {
        math::sequence_empty::sequence_empty::<u32>()
    }

    fn reduce_mean(
        self: @Tensor<u32>,
        axes: Option<Span<usize>>,
        keepdims: Option<bool>,
        noop_with_empty_axes: Option<bool>
    ) -> Tensor<u32> {
        math::reduce_mean::reduce_mean(self, axes, keepdims, noop_with_empty_axes)
    }

    fn reduce_min(
        self: @Tensor<u32>,
        axes: Option<Span<usize>>,
        keepdims: Option<bool>,
        noop_with_empty_axes: Option<bool>
    ) -> Tensor<u32> {
        math::reduce_min::reduce_min(self, axes, keepdims, noop_with_empty_axes)
    }

    fn pow(self: @Tensor<u32>, other: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn sequence_erase(
        sequence: Array<Tensor<u32>>, position: Option<Tensor<i32>>
    ) -> Array<Tensor<u32>> {
        math::sequence_erase::sequence_erase(sequence, position)
    }

    fn sequence_insert(
        self: Array<Tensor<u32>>, tensor: @Tensor<u32>, position: Option<Tensor<i32>>
    ) -> Array<Tensor<u32>> {
        math::sequence_insert::sequence_insert(self, tensor, position)
    }

    fn is_inf(
        self: @Tensor<u32>, detect_negative: Option<u8>, detect_positive: Option<u8>
    ) -> Tensor<bool> {
        math::is_inf::is_inf(self, detect_negative, detect_positive)
    }

    fn is_nan(self: @Tensor<u32>) -> Tensor<bool> {
        panic(array!['not supported!'])
    }

    fn concat_from_sequence(
        sequence: Array<Tensor<u32>>, axis: i32, new_axis: Option<usize>
    ) -> Tensor<u32> {
        math::concat_from_sequence::concat_from_sequence(sequence, axis, new_axis)
    }

    fn gather_nd(self: @Tensor<u32>, indices: Tensor<usize>, batch_dims: Option<usize>) -> Tensor<u32> {
        math::gather_nd::gather_nd(self, indices, batch_dims)
    }
    
    fn reduce_log_sum(self: @Tensor<u32>, axis: usize, keepdims: bool) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn erf(self: @Tensor<u32>) -> Tensor<u32> {
        panic(array!['not supported!'])
    }

    fn unique(
        self: @Tensor<u32>, axis: Option<usize>, sorted: Option<bool>
    ) -> (Tensor<u32>, Tensor<i32>, Tensor<i32>, Tensor<i32>) {
        manipulation::unique::unique(self, axis, sorted)
    }
}

/// Implements addition for `Tensor<u32>` using the `Add` trait.
impl U32TensorAdd of Add<Tensor<u32>> {
    /// Adds two `Tensor<u32>` instances element-wise.
    ///
    /// # Arguments
    /// * `lhs` - The first tensor.
    /// * `rhs` - The second tensor.
    ///
    /// # Returns
    /// * A `Tensor<u32>` instance representing the result of the element-wise addition.
    fn add(lhs: Tensor<u32>, rhs: Tensor<u32>) -> Tensor<u32> {
        math::arithmetic::add(@lhs, @rhs)
    }
}

/// Implements subtraction for `Tensor<u32>` using the `Sub` trait.
impl U32TensorSub of Sub<Tensor<u32>> {
    /// Subtracts two `Tensor<u32>` instances element-wise.
    ///
    /// # Arguments
    /// * `lhs` - The first tensor.
    /// * `rhs` - The second tensor.
    ///
    /// # Returns
    /// * A `Tensor<u32>` instance representing the result of the element-wise subtraction.
    fn sub(lhs: Tensor<u32>, rhs: Tensor<u32>) -> Tensor<u32> {
        math::arithmetic::sub(@lhs, @rhs)
    }
}

/// Implements multiplication for `Tensor<u32>` using the `Mul` trait.
impl U32TensorMul of Mul<Tensor<u32>> {
    /// Multiplies two `Tensor<u32>` instances element-wise.
    ///
    /// # Arguments
    /// * `lhs` - The first tensor.
    /// * `rhs` - The second tensor.
    ///
    /// # Returns
    /// * A `Tensor<u32>` instance representing the result of the element-wise multiplication.
    fn mul(lhs: Tensor<u32>, rhs: Tensor<u32>) -> Tensor<u32> {
        math::arithmetic::mul(@lhs, @rhs)
    }
}

/// Implements division for `Tensor<u32>` using the `Div` trait.
impl U32TensorDiv of Div<Tensor<u32>> {
    /// Divides two `Tensor<u32>` instances element-wise.
    ///
    /// # Arguments
    /// * `lhs` - The first tensor.
    /// * `rhs` - The second tensor.
    ///
    /// # Returns
    /// * A `Tensor<u32>` instance representing the result of the element-wise division.
    fn div(lhs: Tensor<u32>, rhs: Tensor<u32>) -> Tensor<u32> {
        math::arithmetic::div(@lhs, @rhs)
    }
}

/// Implements partial equal for two `Tensor<u32>` using the `PartialEq` trait.
impl U32TensorPartialEq of PartialEq<Tensor<u32>> {
    fn eq(lhs: @Tensor<u32>, rhs: @Tensor<u32>) -> bool {
        tensor_eq(*lhs, *rhs)
    }

    fn ne(lhs: @Tensor<u32>, rhs: @Tensor<u32>) -> bool {
        !tensor_eq(*lhs, *rhs)
    }
}


impl U32TryIntoI8 of TryInto<u32, i8> {
    fn try_into(self: u32) -> Option<i8> {
        Option::Some(i8 { mag: self.try_into().unwrap(), sign: false })
    }
}

/// Implements partial ord for two `Tensor<u32>` using `PartialOrd` trait.
impl U32TensorPartialOrd of PartialOrd<Tensor<u32>> {
    #[inline(always)]
    fn ge(lhs: Tensor<u32>, rhs: Tensor<u32>) -> bool {
        return SpanPartialOrd::ge(lhs.data, rhs.data);
    }

    #[inline(always)]
    fn gt(lhs: Tensor<u32>, rhs: Tensor<u32>) -> bool {
        return SpanPartialOrd::gt(lhs.data, rhs.data);
    }

    #[inline(always)]
    fn le(lhs: Tensor<u32>, rhs: Tensor<u32>) -> bool {
        return SpanPartialOrd::le(lhs.data, rhs.data);
    }

    #[inline(always)]
    fn lt(lhs: Tensor<u32>, rhs: Tensor<u32>) -> bool {
        return SpanPartialOrd::lt(lhs.data, rhs.data);
    }
}

// Internals

fn tensor_eq(mut lhs: Tensor<u32>, mut rhs: Tensor<u32>,) -> bool {
    let mut is_eq = true;

    loop {
        if lhs.shape.len() == 0 || !is_eq {
            break;
        }

        is_eq = lhs.shape.pop_front().unwrap() == rhs.shape.pop_front().unwrap();
    };

    if !is_eq {
        return false;
    }

    loop {
        if lhs.data.len() == 0 || !is_eq {
            break;
        }

        is_eq = lhs.data.pop_front().unwrap() == rhs.data.pop_front().unwrap();
    };

    return is_eq;
}
