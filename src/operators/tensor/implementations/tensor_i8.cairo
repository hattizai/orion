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
use orion::operators::tensor::implementations::{tensor_u32::U32Tensor, tensor_bool::BoolTensor};

impl I8Tensor of TensorTrait<i8> {
    fn new(shape: Span<usize>, data: Span<i8>) -> Tensor<i8> {
        new_tensor(shape, data)
    }

    fn constant_of_shape(shape: Span<usize>, value: i8) -> Tensor<i8> {
        constant_of_shape(shape, value)
    }

    fn at(self: @Tensor<i8>, indices: Span<usize>) -> i8 {
        *at_tensor(self, indices)
    }

    fn add(lhs: Tensor<i8>, rhs: Tensor<i8>) -> Tensor<i8> {
        math::arithmetic::add(@lhs, @rhs)
    }

    fn sub(lhs: Tensor<i8>, rhs: Tensor<i8>) -> Tensor<i8> {
        math::arithmetic::sub(@lhs, @rhs)
    }

    fn mul(lhs: Tensor<i8>, rhs: Tensor<i8>) -> Tensor<i8> {
        math::arithmetic::mul(@lhs, @rhs)
    }

    fn div(lhs: Tensor<i8>, rhs: Tensor<i8>) -> Tensor<i8> {
        math::arithmetic::div(@lhs, @rhs)
    }

    fn min_in_tensor(self: @Tensor<i8>) -> i8 {
        math::min_in_tensor::min_in_tensor::<i8, u8>(*self.data)
    }

    fn min(tensors: Span<Tensor<i8>>) -> Tensor<i8> {
        math::min::min(tensors)
    }

    fn max_in_tensor(self: @Tensor<i8>) -> i8 {
        math::max_in_tensor::max_in_tensor(*self.data)
    }

    fn max(tensors: Span<Tensor<i8>>) -> Tensor<i8> {
        math::max::max(tensors)
    }

    fn stride(self: @Tensor<i8>) -> Span<usize> {
        stride(*self.shape)
    }

    fn ravel_index(self: @Tensor<i8>, indices: Span<usize>) -> usize {
        ravel_index(*self.shape, indices)
    }

    fn unravel_index(self: @Tensor<i8>, index: usize) -> Span<usize> {
        unravel_index(index, *self.shape)
    }

    fn reshape(self: @Tensor<i8>, target_shape: Span<usize>) -> Tensor<i8> {
        reshape(self, target_shape)
    }

    fn reduce_sum(self: @Tensor<i8>, axis: usize, keepdims: bool) -> Tensor<i8> {
        math::reduce_sum::reduce_sum(self, axis, keepdims)
    }

    fn reduce_prod(self: @Tensor<i8>, axis: usize, keepdims: bool) -> Tensor<i8> {
        math::reduce_prod::reduce_prod(self, axis, keepdims)
    }

    fn argmax(
        self: @Tensor<i8>, axis: usize, keepdims: Option<bool>, select_last_index: Option<bool>
    ) -> Tensor<usize> {
        math::argmax::argmax(self, axis, keepdims, select_last_index)
    }

    fn argmin(
        self: @Tensor<i8>, axis: usize, keepdims: Option<bool>, select_last_index: Option<bool>
    ) -> Tensor<usize> {
        math::argmin::argmin(self, axis, keepdims, select_last_index)
    }

    fn transpose(self: @Tensor<i8>, axes: Span<usize>) -> Tensor<i8> {
        linalg::transpose::transpose(self, axes)
    }

    fn matmul(self: @Tensor<i8>, other: @Tensor<i8>) -> Tensor<i8> {
        linalg::matmul::matmul(self, other)
    }

    fn exp(self: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn log(self: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn equal(self: @Tensor<i8>, other: @Tensor<i8>) -> Tensor<usize> {
        math::equal::equal(self, other)
    }

    fn greater(self: @Tensor<i8>, other: @Tensor<i8>) -> Tensor<usize> {
        math::greater::greater(self, other)
    }

    fn greater_equal(self: @Tensor<i8>, other: @Tensor<i8>) -> Tensor<usize> {
        math::greater_equal::greater_equal(self, other)
    }

    fn less(self: @Tensor<i8>, other: @Tensor<i8>) -> Tensor<usize> {
        math::less::less(self, other)
    }

    fn less_equal(self: @Tensor<i8>, other: @Tensor<i8>) -> Tensor<usize> {
        math::less_equal::less_equal(self, other)
    }

    fn abs(self: @Tensor<i8>) -> Tensor<i8> {
        math::abs::abs(*self)
    }

    fn neg(self: @Tensor<i8>) -> Tensor<i8> {
        math::neg::neg(*self)
    }

    fn ceil(self: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn sin(self: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn cos(self: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn asin(self: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn cumsum(
        self: @Tensor<i8>, axis: usize, exclusive: Option<bool>, reverse: Option<bool>
    ) -> Tensor<i8> {
        math::cumsum::cumsum(self, axis, exclusive, reverse)
    }

    fn flatten(self: @Tensor<i8>, axis: usize) -> Tensor<i8> {
        math::flatten::flatten(self, axis)
    }

    fn sinh(self: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn tanh(self: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn cosh(self: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn acosh(self: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn asinh(self: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn atan(self: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn xor(self: @Tensor<i8>, other: @Tensor<i8>) -> Tensor<usize> {
        math::xor::xor(self, other)
    }

    fn or(self: @Tensor<i8>, other: @Tensor<i8>) -> Tensor<usize> {
        math::or::or(self, other)
    }

    fn acos(self: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn onehot(
        self: @Tensor<i8>, depth: usize, axis: Option<usize>, values: Span<usize>
    ) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn sqrt(self: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn concat(tensors: Span<Tensor<i8>>, axis: usize,) -> Tensor<i8> {
        math::concat::concat(tensors, axis)
    }

    fn quantize_linear(
        self: @Tensor<i8>, y_scale: @Tensor<i8>, y_zero_point: @Tensor<i8>
    ) -> Tensor::<i8> {
        quantization::quantize_linear::quantize_linear(
            self,
            y_scale,
            y_zero_point,
            NumberTrait::new_unscaled(128, true),
            NumberTrait::new_unscaled(127, false)
        )
    }

    fn dequantize_linear(
        self: @Tensor<i8>, x_scale: @Tensor<i8>, x_zero_point: @Tensor<i8>
    ) -> Tensor::<i8> {
        quantization::dequantize_linear::dequantize_linear(self, x_scale, x_zero_point)
    }

    fn qlinear_add(
        self: @Tensor<i8>,
        a_scale: @Tensor<i8>,
        a_zero_point: @Tensor<i8>,
        b: @Tensor<i8>,
        b_scale: @Tensor<i8>,
        b_zero_point: @Tensor<i8>,
        y_scale: @Tensor<i8>,
        y_zero_point: @Tensor<i8>
    ) -> Tensor::<i8> {
        quantization::qlinear_add::qlinear_add(
            self,
            a_scale,
            a_zero_point,
            b,
            b_scale,
            b_zero_point,
            y_scale,
            y_zero_point,
            NumberTrait::new_unscaled(128, true),
            NumberTrait::new_unscaled(127, false)
        )
    }

    fn qlinear_mul(
        self: @Tensor<i8>,
        a_scale: @Tensor<i8>,
        a_zero_point: @Tensor<i8>,
        b: @Tensor<i8>,
        b_scale: @Tensor<i8>,
        b_zero_point: @Tensor<i8>,
        y_scale: @Tensor<i8>,
        y_zero_point: @Tensor<i8>
    ) -> Tensor::<i8> {
        quantization::qlinear_mul::qlinear_mul(
            self,
            a_scale,
            a_zero_point,
            b,
            b_scale,
            b_zero_point,
            y_scale,
            y_zero_point,
            NumberTrait::new_unscaled(128, true),
            NumberTrait::new_unscaled(127, false)
        )
    }

    fn qlinear_matmul(
        self: @Tensor<i8>,
        a_scale: @Tensor<i8>,
        a_zero_point: @Tensor<i8>,
        b: @Tensor<i8>,
        b_scale: @Tensor<i8>,
        b_zero_point: @Tensor<i8>,
        y_scale: @Tensor<i8>,
        y_zero_point: @Tensor<i8>
    ) -> Tensor::<i8> {
        quantization::qlinear_matmul::qlinear_matmul(
            self,
            a_scale,
            a_zero_point,
            b,
            b_scale,
            b_zero_point,
            y_scale,
            y_zero_point,
            NumberTrait::new_unscaled(128, true),
            NumberTrait::new_unscaled(127, false)
        )
    }

    fn qlinear_concat(
        tensors: Span<Tensor<i8>>,
        scales: Span<Tensor<i8>>,
        zero_points: Span<Tensor<i8>>,
        y_scale: @Tensor<i8>,
        y_zero_point: @Tensor<i8>,
        axis: usize
    ) -> Tensor::<i8> {
        quantization::qlinear_concat::qlinear_concat(
            tensors,
            scales,
            zero_points,
            y_scale,
            y_zero_point,
            axis,
            NumberTrait::new_unscaled(128, true),
            NumberTrait::new_unscaled(127, false)
        )
    }

    fn qlinear_leakyrelu(
        self: @Tensor<i8>, a_scale: @Tensor<i8>, a_zero_point: @Tensor<i8>, alpha: i8
    ) -> Tensor::<i8> {
        quantization::qlinear_leakyrelu::qlinear_leakyrelu(
            self,
            a_scale,
            a_zero_point,
            alpha,
            NumberTrait::new_unscaled(128, true),
            NumberTrait::new_unscaled(127, false)
        )
    }


    fn slice(
        self: @Tensor<i8>,
        starts: Span<usize>,
        ends: Span<usize>,
        axes: Option<Span<usize>>,
        steps: Option<Span<usize>>
    ) -> Tensor<i8> {
        core_tensor::slice::<i8>(self, starts, ends, axes, steps)
    }

    fn gather(self: @Tensor<i8>, indices: Tensor<usize>, axis: Option<usize>) -> Tensor<i8> {
        math::gather::gather(self, indices, axis)
    }

    fn nonzero(self: @Tensor<i8>) -> Tensor<usize> {
        core_tensor::nonzero(self)
    }

    fn squeeze(self: @Tensor<i8>, axes: Option<Span<i32>>) -> Tensor<i8> {
        core_tensor::squeeze(self, axes)
    }

    fn unsqueeze(self: @Tensor<i8>, axes: Span<usize>) -> Tensor<i8> {
        core_tensor::unsqueeze(self, axes)
    }

    fn sign(self: @Tensor<i8>) -> Tensor<i8> {
        math::sign::sign(*self)
    }

    fn clip(self: @Tensor<i8>, min: Option<i8>, max: Option<i8>) -> Tensor<i8> {
        core_tensor::clip(self, min, max)
    }

    fn and(self: @Tensor<bool>, other: @Tensor<bool>) -> Tensor<bool> {
        math::and::and(self, other)
    }

    fn identity(self: @Tensor<i8>) -> Tensor<i8> {
        core_tensor::identity(self)
    }

    fn where(self: @Tensor<i8>, x: @Tensor<i8>, y: @Tensor<i8>) -> Tensor<i8> {
        math::where::where(self, x, y)
    }

    fn bitwise_and(self: @Tensor<i8>, other: @Tensor<i8>) -> Tensor<i8> {
        math::bitwise_and::bitwise_and(self, other)
    }

    fn bitwise_xor(self: @Tensor<i8>, other: @Tensor<i8>) -> Tensor<i8> {
        math::bitwise_xor::bitwise_xor(self, other)
    }

    fn bitwise_or(self: @Tensor<i8>, other: @Tensor<i8>) -> Tensor<i8> {
        math::bitwise_or::bitwise_or(self, other)
    }

    fn round(self: @Tensor<i8>) -> Tensor<i8> {
        math::round::round(*self)
    }

    fn reduce_l1(self: @Tensor<i8>, axis: usize, keepdims: bool) -> Tensor<i8> {
        math::reduce_l1::reduce_l1(self, axis, keepdims)
    }

    fn trilu(self: @Tensor<i8>, upper: bool, k: i64) -> Tensor<i8> {
        linalg::trilu::trilu(self, upper, k)
    }

    fn scatter(
        self: @Tensor<i8>,
        updates: Tensor<i8>,
        indices: Tensor<usize>,
        axis: Option<usize>,
        reduction: Option<usize>
    ) -> Tensor<i8> {
        math::scatter::scatter(self, updates, indices, axis, reduction)
    }

    fn array_feature_extractor(self: @Tensor<i8>, indices: Tensor<usize>) -> Tensor<i8> {
        ml::array_feature_extractor::array_feature_extractor(*self, indices)
    }

    fn binarizer(self: @Tensor<i8>, threshold: Option<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn reduce_sum_square(self: @Tensor<i8>, axis: usize, keepdims: bool) -> Tensor<i8> {
        math::reduce_sum_square::reduce_sum_square(self, axis, keepdims)
    }

    fn reduce_l2(self: @Tensor<i8>, axis: usize, keepdims: bool) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn not(self: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn gather_elements(
        self: @Tensor<i8>, indices: Tensor<usize>, axis: Option<usize>
    ) -> Tensor<i8> {
        math::gather_elements::gather_elements(self, indices, axis)
    }

    fn sequence_length(self: Array<Tensor<i8>>) -> Tensor<u32> {
        math::sequence_length::sequence_length(self)
    }

    fn shrink(self: Tensor<i8>, bias: Option<i8>, lambd: Option<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn sequence_at(sequence: Array<Tensor<i8>>, position: Tensor<i32>) -> Tensor<i8> {
        math::sequence_at::sequence_at(sequence, position)
    }

    fn sequence_construct(tensors: Array<Tensor<i8>>) -> Array<Tensor<i8>> {
        math::sequence_construct::sequence_construct(tensors)
    }


    fn sequence_empty() -> Array<Tensor<i8>> {
        math::sequence_empty::sequence_empty::<i8>()
    }

    fn reduce_mean(
        self: @Tensor<i8>,
        axes: Option<Span<usize>>,
        keepdims: Option<bool>,
        noop_with_empty_axes: Option<bool>
    ) -> Tensor<i8> {
        math::reduce_mean::reduce_mean(self, axes, keepdims, noop_with_empty_axes)
    }

    fn reduce_min(
        self: @Tensor<i8>,
        axes: Option<Span<usize>>,
        keepdims: Option<bool>,
        noop_with_empty_axes: Option<bool>
    ) -> Tensor<i8> {
        math::reduce_min::reduce_min(self, axes, keepdims, noop_with_empty_axes)
    }

    fn pow(self: @Tensor<i8>, other: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn sequence_erase(
        sequence: Array<Tensor<i8>>, position: Option<Tensor<i32>>
    ) -> Array<Tensor<i8>> {
        math::sequence_erase::sequence_erase(sequence, position)
    }

    fn sequence_insert(
        self: Array<Tensor<i8>>, tensor: @Tensor<i8>, position: Option<Tensor<i32>>
    ) -> Array<Tensor<i8>> {
        math::sequence_insert::sequence_insert(self, tensor, position)
    }

    fn is_inf(
        self: @Tensor<i8>, detect_negative: Option<u8>, detect_positive: Option<u8>
    ) -> Tensor<bool> {
        math::is_inf::is_inf(self, detect_negative, detect_positive)
    }

    fn is_nan(self: @Tensor<i8>) -> Tensor<bool> {
        panic(array!['not supported!'])
    }

    fn concat_from_sequence(
        sequence: Array<Tensor<i8>>, axis: i32, new_axis: Option<usize>
    ) -> Tensor<i8> {
        math::concat_from_sequence::concat_from_sequence(sequence, axis, new_axis)
    }

    fn gather_nd(self: @Tensor<i8>, indices: Tensor<usize>, batch_dims: Option<usize>) -> Tensor<i8> {
        math::gather_nd::gather_nd(self, indices, batch_dims)
    }
    
    fn reduce_log_sum(self: @Tensor<i8>, axis: usize, keepdims: bool) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn erf(self: @Tensor<i8>) -> Tensor<i8> {
        panic(array!['not supported!'])
    }

    fn unique(
        self: @Tensor<i8>, axis: Option<usize>, sorted: Option<bool>
    ) -> (Tensor<i8>, Tensor<i32>, Tensor<i32>, Tensor<i32>) {
        manipulation::unique::unique(self, axis, sorted)
    }
}

/// Implements addition for `Tensor<i8>` using the `Add` trait.
impl I8TensorAdd of Add<Tensor<i8>> {
    /// Adds two `Tensor<i8>` instances element-wise.
    ///
    /// # Arguments
    /// * `lhs` - The first tensor.
    /// * `rhs` - The second tensor.
    ///
    /// # Returns
    /// * A `Tensor<i8>` instance representing the result of the element-wise addition.
    fn add(lhs: Tensor<i8>, rhs: Tensor<i8>) -> Tensor<i8> {
        math::arithmetic::add(@lhs, @rhs)
    }
}

/// Implements subtraction for `Tensor<i8>` using the `Sub` trait.
impl I8TensorSub of Sub<Tensor<i8>> {
    /// Subtracts two `Tensor<i8>` instances element-wise.
    ///
    /// # Arguments
    /// * `lhs` - The first tensor.
    /// * `rhs` - The second tensor.
    ///
    /// # Returns
    /// * A `Tensor<i8>` instance representing the result of the element-wise subtraction.
    fn sub(lhs: Tensor<i8>, rhs: Tensor<i8>) -> Tensor<i8> {
        math::arithmetic::sub(@lhs, @rhs)
    }
}

/// Implements multiplication for `Tensor<i8>` using the `Mul` trait.
impl I8TensorMul of Mul<Tensor<i8>> {
    /// Multiplies two `Tensor<i8>` instances element-wise.
    ///
    /// # Arguments
    /// * `lhs` - The first tensor.
    /// * `rhs` - The second tensor.
    ///
    /// # Returns
    /// * A `Tensor<i8>` instance representing the result of the element-wise multiplication.
    fn mul(lhs: Tensor<i8>, rhs: Tensor<i8>) -> Tensor<i8> {
        math::arithmetic::mul(@lhs, @rhs)
    }
}

/// Implements division for `Tensor<i8>` using the `Div` trait.
impl I8TensorDiv of Div<Tensor<i8>> {
    /// Divides two `Tensor<i8>` instances element-wise.
    ///
    /// # Arguments
    /// * `lhs` - The first tensor.
    /// * `rhs` - The second tensor.
    ///
    /// # Returns
    /// * A `Tensor<i8>` instance representing the result of the element-wise division.
    fn div(lhs: Tensor<i8>, rhs: Tensor<i8>) -> Tensor<i8> {
        math::arithmetic::div(@lhs, @rhs)
    }
}

/// Implements partial equal for two `Tensor<i8>` using the `PartialEq` trait.
impl I8TensorPartialEq of PartialEq<Tensor<i8>> {
    fn eq(lhs: @Tensor<i8>, rhs: @Tensor<i8>) -> bool {
        tensor_eq(*lhs, *rhs)
    }

    fn ne(lhs: @Tensor<i8>, rhs: @Tensor<i8>) -> bool {
        !tensor_eq(*lhs, *rhs)
    }
}

/// Implements partial ord for two `Tensor<i8>` using `PartialOrd` trait.
impl I8TensorPartialOrd of PartialOrd<Tensor<i8>> {
    #[inline(always)]
    fn ge(lhs: Tensor<i8>, rhs: Tensor<i8>) -> bool {
        return SpanPartialOrd::ge(lhs.data, rhs.data);
    }

    #[inline(always)]
    fn gt(lhs: Tensor<i8>, rhs: Tensor<i8>) -> bool {
        return SpanPartialOrd::gt(lhs.data, rhs.data);
    }

    #[inline(always)]
    fn le(lhs: Tensor<i8>, rhs: Tensor<i8>) -> bool {
        return SpanPartialOrd::le(lhs.data, rhs.data);
    }

    #[inline(always)]
    fn lt(lhs: Tensor<i8>, rhs: Tensor<i8>) -> bool {
        return SpanPartialOrd::lt(lhs.data, rhs.data);
    }
}

// Internals

fn tensor_eq(mut lhs: Tensor<i8>, mut rhs: Tensor<i8>,) -> bool {
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
