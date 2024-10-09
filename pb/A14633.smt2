;; sequence(s): A14633
;; terms: 0 12 22 70 92 176 210 330 376 532 590 782 852 1080 1162 1426 1520 1820 1926 2262
;; small program: (((1 + 2) * (((x mod 2) + x) * x)) - (x div 2)) * 2
;; fast program: (((1 + (2 * ((x + x) + x))) * ((x mod 2) + x)) - x) - x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (- (* (+ 1 2) (* (+ (modf x 2) x) x)) (divf x 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (- (- (* (+ 1 (* 2 (+ (+ x x) x))) (+ (modf x 2) x)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
